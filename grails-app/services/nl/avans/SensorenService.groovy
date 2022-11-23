package nl.avans

import grails.gorm.transactions.Transactional

@Transactional
class SensorenService {

//    def getSensor(String boxFilter, String sensorFilter, String plaatsFilter) {
//        Sensoren.createCriteria().list {
//            if (boxFilter) {
//                'box' {
//                    ilike('id', boxFilter('*', '%'))
//                }
//            }
//
//            if (sensorFilter && sensorFilter.isInteger()) {
//                eq('sensorId', sensorFilter.toInteger())
//            }
//
//            if (plaatsFilter) {
//                'box' {
//                    ilike('plaats', plaatsFilter.replace('*', '%'))
//                }
//            }
//        }
//    }

    def getData(String boxFilter) {
        if (boxFilter) {
            Metingen.createCriteria().list {
                eq('sensor.box.id', boxFilter)
                order('tijd', 'desc')
                order('sensor.sensorid', 'asc')
                maxResults(100)
            }
        }
        else {
            [] // empty meting list
        }
    }

    def getBoxes() {
        Boxes.createCriteria().list { }
    }
}
