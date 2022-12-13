package nl.avans

import grails.gorm.transactions.Transactional

@Transactional
class SensorenService {

    def getData(String boxFilter, String fromDay, String fromMonth, String fromYear, String toDay, String toMonth, String toYear) {
        Calendar fromDate = Calendar.getInstance();
        fromDate.set(fromYear.toInteger(), fromMonth.toInteger() - 1, fromDay.toInteger() - 1);

        Calendar toDate = Calendar.getInstance();
        toDate.set(toYear.toInteger(), toMonth.toInteger() - 1, toDay.toInteger() - 1);

        if (boxFilter || fromDate || toDate) {
            Metingen.createCriteria().list {
                eq('sensor.box.id', boxFilter)
                between('tijd', fromDate.getTime(), toDate.getTime())
                order('tijd', 'asc')
                order('sensor.sensorid', 'asc')
                //maxResults(100)
            }
        }
        else {
            [] // empty meting list
        }
    }

    def getBoxes() {
        Boxes.createCriteria().list { }
    }

    def getSensors(String boxFilter) {
        if (boxFilter) {
            Sensoren.createCriteria().list {
                eq('box.id', boxFilter)
                order('id', 'asc')
            }
        }
    }
}
