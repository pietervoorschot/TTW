package nl.avans

import grails.testing.gorm.DataTest
import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class SensorenServiceSpec extends Specification implements ServiceUnitTest<SensorenService>, DataTest{
    def setupSpec() {
        mockDomains Boxes, Sensoren
    }

    def setup() {
    }

    def cleanup() {
    }

    void "test getSensors"() {
//        Box box1 = new Box(plaats: 'plek1')
//        box1.id = 'box1a'
//        box1.save()
//
//        Box box2 = new Box(plaats: 'plek2')
//        box2.id = 'box2a'
//        box1.save()
//
//        Sensor sensor1 = new Sensor(soort: 'water', eenheid: 'liter')
//        sensor1.sensorId = 1
//        sensor1.box = box1
//
//        Sensor sensor2 = new Sensor(soort: 'water', eenheid: 'liter')
//        sensor2.sensorId = 2
//        sensor2.box = box2
//
//        expect:
//            service.getSensors(boxFilter, sensorFilter, plaatsFilter)*.id.sort() == result.sort()
//        where:
//            boxFilter       |      sensorFilter        |       plaatsFilter
    }
}
