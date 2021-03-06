// Generated by CoffeeScript 1.3.3
(function() {
  var StatusReportPostView, StatusReportView, _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  this.app = (_ref = window.app) != null ? _ref : {};

  this.app.views = {};

  StatusReportView = (function(_super) {

    __extends(StatusReportView, _super);

    function StatusReportView() {
      return StatusReportView.__super__.constructor.apply(this, arguments);
    }

    StatusReportView.prototype.el = '#status-report';

    StatusReportView.prototype.initialize = function() {
      console.log('==== Initializing report view!');
      this.collection.bind('sync', this.render, this);
      this.collection.fetch();
      return console.log('report:', this.collection);
    };

    StatusReportView.prototype.render = function() {
      var thelist;
      console.log('==== Rendering report (view)', this.collection);
      thelist = $(this.el);
      thelist.empty();
      this.collection.each(function(model) {
        var item;
        item = new this.app.views.StatusReportPostView({
          model: model
        });
        thelist.append(item.render().el);
        return this;
      });
      return console.log('---- Rendering report (view) - finished');
    };

    return StatusReportView;

  })(Backbone.View);

  StatusReportPostView = (function(_super) {

    __extends(StatusReportPostView, _super);

    function StatusReportPostView() {
      this.unrender = __bind(this.unrender, this);
      return StatusReportPostView.__super__.constructor.apply(this, arguments);
    }

    StatusReportPostView.prototype.tagname = 'li';

    StatusReportPostView.prototype.className = 'status-post';

    StatusReportPostView.prototype.template = _.template($('#report-post-tmpl').html());

    StatusReportPostView.prototype.initialize = function() {
      console.log('==== Initializing report post (view)', this.model.get('id'));
      this.listenTo(this.model, 'change', this.render);
      this.listenTo(this.model, 'add', this.render);
      this.listenTo(this.model, 'remove', this.unrender);
      return this.render();
    };

    StatusReportPostView.prototype.render = function() {
      var item_html;
      console.log('==== Rendering report post (view)', this.model.get('id'));
      item_html = this.template(this.model.toJSON());
      console.log('item html', item_html);
      console.log('element', $(this.el));
      console.log('---- Rendering report post (view) - finished');
      $(this.el).html(item_html);
      return this;
    };

    StatusReportPostView.prototype.unrender = function() {
      return $(this.el).remove();
    };

    return StatusReportPostView;

  })(Backbone.View);

  this.app.views.StatusReportView = StatusReportView;

  this.app.views.StatusReportPostView = StatusReportPostView;

  this.app.statusReportView = new StatusReportView({
    collection: this.app.statusReport
  });

  this.app.statusReportPostView = new StatusReportPostView({
    model: new this.app.models.StatusPost
  });

}).call(this);
