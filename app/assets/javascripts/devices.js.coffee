# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app = angular.module("Device",[ 'ngResource', 'ng-rails-csrf' ])

app.factory "Device", ($resource) -> 
  $resource("/devices/:id",{id: "@id"}, {update: {method: "PUT"}})

app.factory "Summary", ($resource) -> 
  $resource("/device/search?dev=",{dev: "@dev"}, {update: {method: "PUT"}})
   

@DeviceCtrl = ($scope, Device, Summary)->
   $scope.devices = Device.query()
   $scope.openModal = (device) ->
     $scope.deviceName = device.name + device.model if device
     $scope.deviceImgUrl = device.image['thumb']['url'] if device
     $scope.summaries = Summary.query(dev: device.id) if device
     $('#myModal').foundation('reveal', 'open') if device
    




