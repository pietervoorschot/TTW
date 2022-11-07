package nl.avans

class Sensor implements Serializable {
    Integer sensorId
    Box box
    String soort
    String eenheid

    static mapping = {
        table = 'Sensor'
    }

    static constraints = {
    }
}
