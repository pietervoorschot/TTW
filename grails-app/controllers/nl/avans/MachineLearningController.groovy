package nl.avans

class MachineLearningController {
    MachineLearningService machineLearningService

    def index() {
        [
                sensors : machineLearningService.getSensors(),
                sensorData : machineLearningService.getData(params.boxFilter),
                boxFilter: params.boxFilter

        ]
    }
}
