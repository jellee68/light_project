all: beam_stab 
HDRS = helper_3dmath.h I2Cdev.h MPU6050_6Axis_MotionApps20.h MPU6050.h 
CMN_OBJS = I2Cdev.o MPU6050.o
DMP_OBJS = beam_stab.o



# Set DMP FIFO rate to 20Hz to avoid overflows.  See comments in
# MPU6050_6Axis_MotionApps20.h for details.

CXXFLAGS = -DDMP_FIFO_RATE=9 -Wall -g -O2 `pkg-config gtkmm-3.0 --cflags --libs`

$(CMN_OBJS) $(DMP_OBJS) $(RAW_OBJS) : $(HDRS)

beam_stab: $(CMN_OBJS) $(DMP_OBJS)
	$(CXX) -o $@ $^ -lm
clean:
	rm -f $(CMN_OBJS) $(DMP_OBJS)  beam_stab 

