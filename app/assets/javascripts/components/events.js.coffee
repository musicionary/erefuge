@Events = React.createClass
  getInitialState: ->
    events: @props.data

  getDefaultProps: ->
    events: []

  addEvent: (event) ->
    events = React.addons.update(@state.events, { $push: [event] })
    @props.handleEventRefresh events
    @setState events: events

  updateEvent: (event, data) ->
    index = @state.events.indexOf event
    events = React.addons.update(@state.events, { $splice: [[index, 1, data]] })
    @props.handleEventRefresh events
    @replaceState events: events

  deleteEvent: (event) ->
    index = @state.events.indexOf event
    events = React.addons.update(@state.events, { $splice: [[index, 1]] })
    @props.handleEventRefresh events
    @replaceState events: events

  render: ->
    React.DOM.div
      className: 'events'
      React.DOM.h2
        className: 'name'
        'Events'
      React.DOM.hr null
      React.DOM.div
        className: "row"
        React.DOM.aside
          className: "col s3"
          React.createElement EventForm, handleNewEvent: @addEvent
        React.DOM.section
          className: "col s9"
          for event in @state.events
            React.createElement Event, key: event.id, event: event,
             handleDeleteEvent: @deleteEvent, handleEditEvent: @updateEvent
