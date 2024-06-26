// challenge 3
public with sharing class Car extends Vehicle {
    
    private Integer steeringRotation;

    private Integer tireRotation;

    private Integer gear;


    public Car() {
        this(0, 'Default', 1, 1);
    }
    
    public Car(Integer speed, String name, Integer occupants, Integer capacity) {
        super(speed, name, occupants, capacity);
        this.steeringRotation = 0;
        this.tireRotation = 0;
        this.gear = 0;
        this.media.add(Medium.LAND);
    }

    public Integer getGear() {
        return this.gear;
    }

    public Integer getSteeringRotation() {
        return this.steeringRotation;
    }

    public Integer getTireRotation() {
        return this.tireRotation;
    }

    public void setSteeringRotation(Integer steer) {
        if((steer > 1440) || (steer < -1440)) {
            throw new IllegalArgumentException('Steering rotation cannot be set to over rotated');
        }
        this.steeringRotation = steer;
    }

    public void setTireRotation(Integer rotation) {
        if((rotation > 90) || (rotation < -90)) {
            throw new IllegalArgumentException('Steering rotation cannot be set to over rotated');
        }
        this.tireRotation = rotation;
    }

    public override void turn(Integer turn) {
        if((this.steeringRotation + turn) > 1440 || (this.steeringRotation + turn < -1440)) {
            throw new IllegalArgumentException('Steering is over rotated');
        }
        Integer tireTurn = turn / 16;
        if((this.tireRotation + tireTurn) > 90 || (this.tireRotation + tireTurn) < -90) {
            throw new IllegalArgumentException('Tire is over rotated');
        }

        this.steeringRotation += turn;
        this.tireRotation += tireTurn;
    }

    public override void accelerate(Integer accel) {
        super.accelerate(accel);

        this.gear = (Integer)Math.ceil(0.4444 * (Math.sqrt(this.getSpeed())));
    }
}