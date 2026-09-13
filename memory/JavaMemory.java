// Java: heap allocation becomes eligible for garbage collection
public class JavaMemory {
    static class Payload {
        private final byte[] data;
        Payload(int bytes) { data = new byte[bytes]; }
        int size() { return data.length; }
    }

    public static void main(String[] args) {
        Payload payload = new Payload(8 * 1024 * 1024);
        System.out.println("allocated bytes = " + payload.size());
        payload = null; // object is now eligible for garbage collection
        System.gc();    // request only; the JVM decides when collection occurs
        System.out.println("reference cleared; GC timing is managed by JVM");
    }
}
