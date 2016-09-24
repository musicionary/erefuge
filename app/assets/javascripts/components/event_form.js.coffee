@EventForm = React.createClass
  getInitialState: ->
    name: ''
    date: ''
    description: ''
    street: ''
    city: ''
    state: ''
    zip_code: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { event: @state }, (data) =>
      @props.handleNewEvent data
      @setState @getInitialState()
    , 'JSON'

  valid: ->
    @state.name && @state.date && @state.description && @state.street && @state.city && @state.state && @state.zip_code

  render: ->
    React.DOM.form
      onSubmit: @handleSubmit
      React.DOM.div
        className: "row"
        React.DOM.div
          className: 'input-field col s12'
          React.DOM.input
            type: 'text'
            placeholder: 'Name'
            name: 'name'
            value: @state.name
            onChange: @handleChange
        React.DOM.div
          className: 'input-field col s12'
          React.DOM.input
            type: 'datetime-local'
            placeholder: 'Date'
            name: 'date'
            value: @state.date
            onChange: @handleChange
        React.DOM.div
          className: 'input-field col s12'
          React.DOM.textarea
            className: 'materialize-textarea'
            placeholder: 'Description'
            name: 'description'
            value: @state.description
            onChange: @handleChange
        React.DOM.div
          className: 'input-field col s12'
          React.DOM.input
            type: 'text'
            placeholder: 'Street'
            name: 'street'
            value: @state.street
            onChange: @handleChange
        React.DOM.div
          className: 'input-field col s12'
          React.DOM.input
            type: 'text'
            placeholder: 'City'
            name: 'city'
            value: @state.city
            onChange: @handleChange
        React.DOM.div
          className: 'input-field col s12'
          React.DOM.input
            type: 'text'
            placeholder: 'State'
            name: 'state'
            value: @state.state
            onChange: @handleChange
        React.DOM.div
          className: 'input-field col s12'
          React.DOM.input
            type: 'text'
            placeholder: 'Zip code'
            name: 'zip_code'
            value: @state.zip_code
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'waves-effect waves-light btn'
          disabled: !@valid()
          'Add This Event'
