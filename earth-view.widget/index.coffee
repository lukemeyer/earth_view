# parse site for an image id, then build the url and download the image
command: 'num=$(curl -s earthview.withgoogle.com | grep -E -o "id&#34;\:&#34;([0-9]*)" | grep -E -o "[0-9]{4}"); curl -so earth-view.widget/images/img.jpg www.gstatic.com/prettyearth/assets/full/${num}.jpg'

# Set the refresh frequency (milliseconds).
refreshFrequency: 200000

style: """
  top: 0%
  left: 0%
  color: #fff
  
  .earth
    height: 100%
    width: 100%
    position: absolute
    z-index:-1
"""

render: -> """
<div id='background'></div>
"""

# Update the rendered output.
update: (output, domEl) ->
  mydiv = $(domEl).find('div')
  html = ''
  
  html += "<div class='earth'>"
  html += "<img src='earth-view.widget/images/img.jpg' >"
  html += "</div>"
  
  # Set the output
  mydiv.html(html)
