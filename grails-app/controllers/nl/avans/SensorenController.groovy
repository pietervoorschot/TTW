package nl.avans

class SensorenController {
    SensorenService sensorenService

    def index() {
        [
            boxes           : sensorenService.getBoxes(),
            sensors         : sensorenService.getSensors(params.boxFilter),
            sensorData      : sensorenService.getData(params.boxFilter, params.fromDate_year, params.fromDate_month, params.fromDate_day, params.fromDate_hour, params.fromDate_minute, params.toDate_year, params.toDate_month, params.toDate_day, params.toDate_hour, params.toDate_minute),
            boxFilter       : params.boxFilter
        ]
    }
}
