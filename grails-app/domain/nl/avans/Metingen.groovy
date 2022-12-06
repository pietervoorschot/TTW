package nl.avans

class Metingen implements Serializable {
    Sensoren sensor
    Date tijd
    Integer waarde

    static transients = ['label']

    static mapping = {
        table name: 'metingen'

        id composite: ['sensor', 'tijd']

        columns {
            sensor {
                column name: 'sensorid', sqlType: 'INT'
                column name: 'boxid', sqlType: 'VARCHAR'
            }
        }
        waarde column: 'waarde', sqlType: 'INT'

        version false
    }

    static constraints = {
    }
    String getLabel(){
        "'${tijd}'"
    }
}
