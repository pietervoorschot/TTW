package nl.avans

class SensorController {
    SensorService sensorService

    def index() {
        {
            sensors: sensorService.getSensor(params.boxFilter, params.sensorFilter,params.plaatsFilter)
            sensorData: sensorService.data
            boxFilter: params.boxFilter
            sensorFilter: params.sensorFilter
            plaatsFilter: params.plaatsFilter
        }
    }
}
