@Events = React.createClass
  getInitialState: ->
    events: @props.data

  getDefaultProps: ->
    events: []

  addEvent: (event) ->
    events = React.addons.update(@state.events, { $push: [event] })
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
        className: 'name center-align events-header grey-text text-lighten-5'
        'Upcoming Events'
      React.DOM.div
        className: "row"
        React.DOM.aside
          className: "col l3 m6 white"
          React.DOM.h3 null,
            "Create An Event"
          React.createElement EventForm, handleNewEvent: @addEvent
        React.DOM.section
          className: "col l9 m6"
          for event in @state.events
            React.createElement Event, key: event.id, event: event, handleDeleteEvent: @deleteEvent, handleEditEvent: @updateEvent
