# Brian Kintz
# 23.12.2014

command: "echo 'Hello World'"

days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
#days: ["Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"]

refreshFrequency: 10000

style: """
    bottom: 20px
    left: 20px
    width: 230px
    color: white
    font-family: "Helvetica Neue"
    white-space: nowrap

    .datetime
        height: 50px
        padding: 10px 16px 10px 13px
        background: rgba(#000, 0.3)
        border-radius: 10px

    .time
        float: left
        font-size: 32pt
        font-weight: 100

    .date_wrapper
        float: right
        margin-top: 3px

    .time_separator
        position: relative
        top: -0.05em

    .datepart
        -webkit-font-smoothing: antialiased
        font-size: 12pt
        font-weight: 200
        color: rgba(#FFF, 0.6)

    .divider
        height: 2px
        margin: 3px 0px 2px 0px
        background: rgba(#FFF, 0.3)
"""

render: (_) -> """
    <div class="datetime">
        <div class="time"></div>
        <div class="date_wrapper">
            <div class="datepart" id="dow"></div>
            <div class="divider"></div>
            <div class="datepart" id="date"></div>
        </div>
    </div>
"""

update: (output, domEl) ->
    date = new Date()

    hour = date.getHours()
    hour = '0' + hour if hour < 10

    minutes = date.getMinutes()
    minutes = '0' + minutes if minutes < 10

    day = date.getDate()
    day = '0' + day if day < 10

    month = date.getMonth() + 1
    month = '0' + month if month < 10

    year = date.getFullYear()

    $(domEl).find('.time').html(hour + '<span class="time_separator">:</span>' + minutes)
    $(domEl).find('.datepart#dow').html(this.days[date.getDay()])
    $(domEl).find('.datepart#date').html(day+'.'+month+'.'+year)
