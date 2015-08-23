//
//  U4DTimer.h
//  UntoldEngine
//
//  Created by Harold Serrano on 6/9/13.
//  Copyright (c) 2013 Untold Story Studio. All rights reserved.
//

#ifndef __UntoldEngine__U4DTimer__
#define __UntoldEngine__U4DTimer__

#include <iostream>
#include "U4DCallbackInterface.h"

namespace U4DEngine {
    
class U4DTimer{
  
private:
    U4DCallbackInterface *pCallback;
    bool repeat;
    double delay;
    double currentTime;
    int index;
    
public:
    
    //constructor
    U4DTimer():currentTime(0.0),repeat(false),delay(0.0){};
    
    U4DTimer(U4DCallbackInterface *uPCallback):currentTime(0.0),repeat(false),delay(0.0),pCallback(uPCallback){};
    
    //desctructor
    ~U4DTimer(){};
    
    void initCallback(U4DCallbackInterface *uPCallback){
        pCallback=uPCallback;
    }
    
    void timerExpire(); //called when the timer has reached duration
    void tick(double dt);
    inline void setIndex(int uIndex){index=uIndex;};
    inline int getIndex(){return index;};
    
    inline void setDelay(double uDelay){delay=uDelay;};
    inline double getDelay() const{return delay;};
    inline void setRepeat(bool uRepeat){repeat=uRepeat;}
};

}

#endif /* defined(__UntoldEngine__U4DTimer__) */