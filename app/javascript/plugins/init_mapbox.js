import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    mapbox_gl__WEBPACK_IMPORTED_MODULE_0___default.a.accessToken = mapElement.dataset.mapboxApiKey;
    var map = new mapbox_gl__WEBPACK_IMPORTED_MODULE_0___default.a.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/light-v10'
    });
    var markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach(function (marker) {
      console.log(marker);
      marker.className = '';
      var popup = new mapbox_gl__WEBPACK_IMPORTED_MODULE_0___default.a.Popup().setHTML(marker.infoWindow);
      var element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = "url('".concat(marker.image_url, "')");
      element.style.backgroundSize = 'contain';
      element.style.width = '30px';
      element.style.height = '30px';
      new mapbox_gl__WEBPACK_IMPORTED_MODULE_0___default.a.Marker(element).setLngLat([marker.lng, marker.lat]).setPopup(popup).addTo(map);
    });
    fitMapToMarkers(map, markers); // addMarkersToMap(map, markers)
  }
};

export { initMapbox };
