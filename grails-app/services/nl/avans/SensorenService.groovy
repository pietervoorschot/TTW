package nl.avans

import grails.gorm.transactions.Transactional
import org.apache.tomcat.jni.Time
import org.springframework.http.server.DelegatingServerHttpResponse

import java.time.LocalDateTime

@Transactional
class SensorenService {

    def getData(String boxFilter, String fromYear, String fromMonth, String fromDay, String fromHour, String fromMinute, String toYear, String toMonth, String toDay, String toHour, String toMinute) {
        Calendar fromDate = Calendar.getInstance();
        if (fromYear != null)
            fromDate.set(fromYear.toInteger(), fromMonth.toInteger() - 1, fromDay.toInteger() - 1, fromHour.toInteger(), fromMinute.toInteger());
        else
            fromDate.setTime(new Date());

        Calendar toDate = Calendar.getInstance();
        if (toYear != null)
            toDate.set(toYear.toInteger(), toMonth.toInteger() - 1, toDay.toInteger() - 1, toHour.toInteger(), toMinute.toInteger());
        else
            toDate.setTime(new Date());

        if (boxFilter || fromDate || toDate) {
            Metingen.createCriteria().list {
                eq('sensor.box.id', boxFilter)
                between('tijd', fromDate.getTime(), toDate.getTime())
                order('tijd', 'asc')
                order('sensor.id', 'asc')
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
