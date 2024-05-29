class Logger() {

private val lastTimestamps = LinkedHashMap<String, Int>()
    fun shouldPrintMessage(timestamp: Int?, message: String?): Boolean? {
       if (timestamp == null || message == null) return false

        val lastTimestamp = lastTimestamps[message]
        return if (lastTimestamp == null || timestamp - lastTimestamp >= 10) {
            lastTimestamps[message] = timestamp
            true
        } else {
            false
        }
    }

}

/**
 * Your Logger object will be instantiated and called as such:
 * var obj = Logger()
 * var param_1 = obj.shouldPrintMessage(timestamp,message)
 */