package nl.avans

class SensorenController {
    SensorenService sensorenService

    def index() {
        [
            boxes           : sensorenService.getBoxes(),
            sensors         : sensorenService.getSensors(params.boxFilter),
            sensorData      : sensorenService.getData(params.boxFilter, params.fromDate_day, params.fromDate_month, params.fromDate_year, params.toDate_day, params.toDate_month, params.toDate_year),
            boxFilter       : params.boxFilter,
            startDateFilter : params.startDateFilter,
            endDateFilter   : params.endDateFilter
        ]
    }
}
