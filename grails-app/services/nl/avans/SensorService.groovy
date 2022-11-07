package nl.avans

import grails.gorm.transactions.Transactional

@Transactional
class SensorService {

    def getSensor(String boxFilter, String sensorFilter, String plaatsFilter) {
        Sensor.createCriteria().list {
            if (boxFilter) {
                'box' {
                    ilike('id', boxFilter('*', '%'))
                }
            }

            if (sensorFilter && sensorFilter.isInteger()) {
                eq('sensorId', sensorFilter.toInteger())
            }

            if (plaatsFilter) {
                'box' {
                    ilike('plaats', plaatsFilter.replace('*', '%'))
                }
            }
        }
    }
}
