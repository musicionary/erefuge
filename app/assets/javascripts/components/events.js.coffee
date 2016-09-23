@Events = React.createClass
  getInitialState: ->
    events: @props.events

  getDefaultProps: ->
    events: []

  addEvent: (event) ->
    events = React.addons.update(@state.events, { $push: [event] })
    @props.handleEventRefresh events
    @setState events: events

  updateEvent: (event, data) ->
    index = @state.events.indexOf event
    events = React.addons.update(@state.events, { $splice: [[index, 1, data]] })
    @replaceState events: events

  deleteEvent: (event) ->
    index = @state.events.indexOf event
    events = React.addons.update(@state.events, { $splice: [[index, 1]] })
    @replaceState events: events

  render: ->
    React.DOM.div
      className: 'events'
      React.DOM.h2
        className: 'name'
        'Events'
      React.createElement EventForm, handleNewEvent: @addEvent
      React.DOM.hr null
      React.DOM.section
        className: "row"
        for event in @state.events
          React.createElement Event, key: event.id, event: event,
          handleDeleteEvent: @deleteEvent, handleEditEvent: @updateEvent
