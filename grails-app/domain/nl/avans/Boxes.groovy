package nl.avans

class Boxes implements Serializable {
    String id
    String plaats

    static mapping = {
        table name: 'boxes'

        id column: 'boxid', sqlType: 'VARCHAR', generator: 'assigned'
        plaats column: 'plaats', sqlType: 'VARCHAR'

        version false
    }

    static constraints = {
    }
}
