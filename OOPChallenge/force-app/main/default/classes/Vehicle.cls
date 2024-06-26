public with sharing abstract class Vehicle {

    // Challenge 1 and 2
    public enum Medium {LAND, AIR, WATER}

    private Integer speed;
    private String name;
    public Integer occupants;
    final public Integer capacity;
    protected List<Medium> media;
 
    public Vehicle() {
        this(0, 'Default', 1, 1);
    }

    public Vehicle(Integer speed, String name, Integer occupants, Integer capacity) {
        if(speed < 0) {
            throw new IllegalArgumentException('Speed cannot be negative');
        }

        if(occupants < 0 ) {
            throw new IllegalArgumentException('Occupants cannot be negative');
        }

        if(capacity < 1) {
            throw new IllegalArgumentException('Capacity must be 1 or greater');
        }


        this.speed = speed;
        this.name = name;
        this.occupants = occupants;
        this.capacity = capacity;
        this.media = new List<Medium>();
    }

    public Integer getSpeed() {
        return this.speed;
    }

    public String getName() {
        return this.name;
    }

    public virtual void accelerate(Integer accel) {
        if (this.speed + accel < 0) {
            throw new IllegalArgumentException('Speed cannot be negative');
        }
        this.speed += accel;
    }

    public abstract void turn(Integer turn);


    public override String toString() {
        return 'Speed: ' + this.speed + ', Name: ' + this.name + ', Occupants: ' + this.occupants + ', Media: ' + this.media;
    }
}