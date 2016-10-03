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
      className: "col s12 m6"
      React.DOM.div
        className: "card"
        React.DOM.div
          className: "card-image waves-effect waves-block waves-light"
          React.DOM.iframe
            className: ""
            src: "https://www.google.com/maps/embed/v1/place?key=AIzaSyAG-ySQ04kts2AnablMVVkD32vDu74jJ_4&q=#{@props.event.street + @props.event.city + @props.event.state + @props.event.zip_code}"
        React.DOM.div
          className: "card-content"
          React.DOM.span
            className: "card-title activator grey-text text-darken-4"
            @props.event.name
            React.DOM.i
              className: "material-icons right"
              "more_vert"
          React.DOM.hr null
          React.DOM.p
            React.DOM.a
              href: "#"
              #make this "add to your events function"
              "This is a link"
        React.DOM.div
          className: "card-reveal"
          React.DOM.span
            className: "card-title grey-text text-darken-4"
            @props.event.name
            React.DOM.i
              className: "material-icons right"
              "close"
          React.DOM.p
            @props.event.description
          React.DOM.p null, @props.event.date
          React.DOM.a
            className: 'waves-effect waves-light btn'
            onClick: @handleToggle
            React.DOM.i
              className: 'material-icons'
              "mode_edit"
          React.DOM.a
            className: 'waves-effect waves-light btn'
            onClick: @handleDelete
            React.DOM.i
              className: 'material-icons'
              "delete_forever"
  eventForm: ->
    React.DOM.div
      className: "col s12 m6"
      React.DOM.div
        className: "card"
        React.DOM.div
          className: "row"
          React.DOM.div
            className: "input-field col s12"
            React.DOM.input
              className: ""
              type: "text"
              defaultValue: @props.event.name
              ref: 'name'
          React.DOM.div
            className: "input-field col s12"
            React.DOM.input
              className: ""
              type: "datetime-local"
              defaultValue: @props.event.date
              ref: 'date'
          React.DOM.br

          React.DOM.div
            className: "input-field col s12"
            React.DOM.textarea
              className: "materialize-textarea"
              type: "text"
              defaultValue: @props.event.description
              ref: 'description'
          React.DOM.div
            className: "input-field col s12"
            React.DOM.input
              className: ""
              type: "text"
              defaultValue: @props.event.street
              ref: 'street'
          React.DOM.div
            className: "input-field col s12"
            React.DOM.input
              className: ""
              type: "text"
              defaultValue: @props.event.city
              ref: 'city'
          React.DOM.div
            className: "input-field col s12"
            React.DOM.input
              className: ""
              type: "text"
              defaultValue: @props.event.state
              ref: 'state'
          React.DOM.div
            className: "input-field col s12"
            React.DOM.input
              className: ""
              type: "text"
              defaultValue: @props.event.zip_code
              ref: 'zip_code'
          React.DOM.div
            className: "row container"
            React.DOM.a
              className: 'col s6 waves-effect waves-light btn'
              onClick: @handleEdit
              React.DOM.i
                className: 'material-icons'
                "done"
            React.DOM.a
              className: 'col s6 waves-effect waves-light btn'
              onClick: @handleToggle
              React.DOM.i
                className: 'material-icons'
                "clear"
  render: ->
    if @state.edit
      @eventForm()
    else
      @eventRow()
