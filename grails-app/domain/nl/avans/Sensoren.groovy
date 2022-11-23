package nl.avans

class Sensoren implements Serializable {
    Integer sensorid
    Boxes box
    String soort
    String eenheid

    static mapping = {
        table name: 'sensoren'

        id composite: ['sensorid', 'box']

        sensorid column: 'sensorid', sqlType: 'INT'
        box column: 'boxid', sqlType: 'VARCHAR'
        soort column: 'soort', sqlType: 'VARCHAR'
        eenheid column: 'eenheid', sqlType: 'VARCHAR'

        version false
    }

    static constraints = {
    }
}
