@Event = React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleEdit: (e) ->
    e.preventDefault()
    data =
      name: this.refs.name.value
      date: this.refs.date.value
      description: this.refs.description.value
      street: this.refs.street.value
      city: this.refs.city.value
      state: this.refs.state.value
      zip_code: this.refs.zip_code.value
    $.ajax
      method: "PUT"
      url: "/events/#{ @props.event.id }"
      dataType: 'JSON'
      data:
        event: data
      success: (data) =>
        @setState edit: false
        @props.handleEditEvent @props.event, data

  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/events/#{ @props.event.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteEvent @props.event

  eventRow: ->
    React.DOM.div
      className: "col s12 m7"
      React.DOM.h3
        className: "header"
        @props.event.name
        React.DOM.div
          className: "card horizontal"
          React.DOM.div
            className: "card-image"
            React.DOM.img
              src: "http://lorempixel.com/100/190/nature/6"
          React.DOM.div
            className: "card-stacked"
            React.DOM.div
              className: "card-content"
              React.DOM.p null, @props.event.description
              React.DOM.p null, @props.event.date
              React.DOM.p null, @props.event.street
              React.DOM.p null, @props.event.city
              React.DOM.p null, @props.event.state
              React.DOM.p null, @props.event.zip_code
              React.DOM.div
                className: "card-action">
                React.DOM.a
                  className: 'waves-effect waves-light btn'
                  onClick: @handleToggle
                  React.DOM.i
                    className: 'material-icons'
                    "mode_edit"
                React.DOM.a
                  className: 'btn btn-danger'
                  onClick: @handleDelete
                  React.DOM.i
                    className: 'material-icons'
                    "delete_forever"
  eventForm: ->
    React.DOM.div
      className: "col s12 m7"
      React.DOM.div
        className: "row"
        React.DOM.div
          className: "input-field col s6"
          React.DOM.input
            className: "validate"
            type: "text"
            defaultValue: @props.event.name
            ref: 'name'
        React.DOM.div
          className: "input-field col s6"
          React.DOM.input
            className: "validate"
            type: "datetime"
            defaultValue: @props.event.date
            ref: 'date'
        React.DOM.div
          className: "input-field col s6"
          React.DOM.input
            className: "validate"
            type: "text"
            defaultValue: @props.event.description
            ref: 'description'
        React.DOM.div
          className: "input-field col s6"
          React.DOM.input
            className: "validate"
            type: "text"
            defaultValue: @props.event.street
            ref: 'street'
        React.DOM.div
          className: "input-field col s6"
          React.DOM.input
            className: "validate"
            type: "text"
            defaultValue: @props.event.city
            ref: 'city'
        React.DOM.div
          className: "input-field col s6"
          React.DOM.input
            className: "validate"
            type: "text"
            defaultValue: @props.event.state
            ref: 'state'
        React.DOM.div
          className: "input-field col s6"
          React.DOM.input
            className: "validate"
            type: "text"
            defaultValue: @props.event.zip_code
            ref: 'zip_code'
        React.DOM.a
          className: 'waves-effect waves-light btn'
          onClick: @handleEdit
          React.DOM.i
            className: 'material-icons'
            "done"
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          React.DOM.i
            className: 'material-icons'
            "clear"
  render: ->
    if @state.edit
      @eventForm()
    else
      @eventRow()
