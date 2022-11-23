package nl.avans

class SensorenController {
    SensorenService sensorenService

    def index() {
        [
            boxes       : sensorenService.getBoxes(),
            sensorData  : sensorenService.getData(params.boxFilter),
            boxFilter   : params.boxFilter
        ]
    }
}
