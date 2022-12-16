package nl.avans

import grails.gorm.transactions.Transactional

@Transactional
class MachineLearningService {
    def getSensors(String boxFilter){
        if (boxFilter){
            Sensoren.createCriteria().list{
                eq('box.id', boxFilter)
                order('id', 'asc')
            }
        }
    }

    def getData(String boxFilter){
        if (boxFilter){
            Metingen.createCriteria().list{
                eq(sensor.box.id, boxFilter)
            }
    }

    }

}
