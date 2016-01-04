
<label for="locationTextField">Location</label>
        <input id="locationTextField" type="text" size="50">

        <script>
            function init() {
                var input = document.getElementById('locationTextField');
                var autocomplete = new google.maps.places.Autocomplete(input);
            }

            google.maps.event.addDomListener(window, 'load', init);
        </script>
<div id="map_canvas" style="width: 100%; height: 100%;" >
	<script type="text/javascript"> initialize(0, 0); </script>
	<script type="text/javascript" src='https://www.google.com/jsapi?autoload={"modules":[{"name":"visualization","version":"1","packages":["corechart","controls","table"]}]}'></script>
</div>

