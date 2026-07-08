# Swerve Drive From First Principles 

## Prerequisite Knowledge

You can skip this if you are already familiar with swerve drive

Setting up background

A swerve drive is a type of holonomic drive base, meaning it can translate and
rotate independently. Swerve drives have a unique property compared to other
holonomic drives (mecanum, X-drive, H-Drive). Every wheel contributes directly
to movement of the robot for any given movement. As a result, swerve drives are
very quick and agile by utilizing the full power of every motor on the chassis.

Physical components of a swerve drive:

**Note:** There are two kinds of swerve drives, differential and coaxial. The
content of this article is made for coaxial swerve although, this only matters
when calculating motor output from a module state.

- A *swerve drive chassis* is comprised of at least three modules (for
  stability), with four modules being most common.
- A *swerve module* has two motors (and motor controllers) and an absolute
  encoder.
- The *drive motor* drives the module's wheel. This motor needs to be powerful
  because it is responsible for acceleration and pushing force.
- The *turning motor* (occasionally called the azimuth motor) rotates the
  direction the wheel points. This motor needs to be quick because the more
  time the wheel isn't pointing in the correct direction is more time that
  wheel isn't contributing to the over all robot state.
- The *absolute encoder* is mounted on anything driven by the turning motor
  because you need to use it to initialize the direction the wheel is pointing
  when the robot powers up. It is also usually more accurate than the internal
  encoder inside the turning motor.

What are we trying to accomplish?

In short, finding motor outputs from robot translation and rotation
velocities. This is done in a couple of steps.

1. The user determines what the robot state should be. This could be through
   inputs from handheld controllers, on-board sensors, or even autonomous
   routines.
2. The robot state and drive train kinematics are used to calculate the module
   state in the form of a vector.
3. The module state is used to calculate the direction and speed of the wheel.
4. The direction, speed, and absolute encoder are used to calculate the outputs
   of the motors.

My representation of it graphically

Mathematical representation

## Translation and Rotation Independently is Trivial

To better understand the problem we face, let's try to tackle two sub-problems
of swerve.

First, try to calculate the module states when the robot is only translating,
such as:

robot state:
TODO: put image of robot state with just translation

module state:
TODO: put image of robot and modulestate with just translation

Hopefully, you saw the solution for translation is to point all of the modules
in direction of movement and scale the speed of the module accordingly.

TODO: Three images of swerve + modules in three different directions side by side

Rotation is pointing all wheels at 45 degree angles and scaling the speed
proportionately.

It is trivial to find module states when the robot is only translating or
rotating. However, it's a little more difficult when combining the two.

## The Fundamental Principles of Swerve

What we've just discovered by pretending to be the program are the building
blocks for calculating module states mathematically.

  1. Purely translational movement is only in the direction of the offset vector
  2. Purely rotational movement per module is movement orthogonal to its offset vector

Demonstrate those principles with diagrams

Now, what does that look like mathematically?

Create "the swerve formula"

module output vector = translational_velocity_vec + rot_speed * orthogonal(offset_vector)

## Other optimizations

### Speed normalization

  1. Clamping speed at a max velocity (bad because it distorts the robot movement)
  2. Pre-normalizing the speeds (good because it works)

### Direction Flipping

sometimes it's shorter to point the opposite direction and flip the speed. This
has added benefit because now a module should never have to travel further than
90 degrees.

### Stray module problem

cosine scaling

or explicit avoidance (sorta meh)

