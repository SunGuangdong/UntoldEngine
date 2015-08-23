//
//  U4DControllerInterface.h
//  UntoldEngine
//
//  Created by Harold Serrano on 6/10/13.
//  Copyright (c) 2013 Untold Story Studio. All rights reserved.
//

#ifndef __UntoldEngine__U4DControllerInterface__
#define __UntoldEngine__U4DControllerInterface__

#include <iostream>
#include <vector>
#include "CommonProtocols.h"

namespace U4DEngine {
    
class U4DEntity;
class U4DTouches;
class U4DButton;
class U4DJoyStick;
class U4DWorld;
class U4DVector2n;
class U4DGameModelInterface;

}

namespace U4DEngine {
    
class U4DControllerInterface{
  
private:
    
    
public:
    
    //U4DWorld *gameWorld;
    U4DGameModelInterface *gameModel;
    
    U4DEntity *controlledU4DObject;
    
    std::vector<U4DButton*> buttonsArray;
    std::vector<U4DJoyStick*> joyStickArray;
    
    virtual ~U4DControllerInterface(){};
    
    virtual void touchBegan(const U4DTouches &touches)=0;
    virtual void touchMoved(const U4DTouches &touches)=0;
    virtual void touchEnded(const U4DTouches &touches)=0;
    
    
    virtual void keyboardInput(int key)=0;
    
    virtual void add(U4DButton *uButton,U4DVector2n &buttonPosition,TouchState touchActionOn)=0;
    virtual void add(U4DButton *uButton)=0;
    
    virtual void add(U4DJoyStick *uJoyStick)=0;
    
    virtual void changeState(const U4DTouches &touches,TouchState touchState)=0;
    
    virtual void draw()=0;
    virtual void update(float dt)=0;
    virtual void init()=0;
    
    virtual inline void setGameWorld(U4DWorld *uGameWorld){}
    virtual inline void setGameModel(U4DGameModelInterface *uGameModel){gameModel=uGameModel;}
    virtual void setEntityToControl(U4DEntity *uEntity)=0;
};

}
#endif /* defined(__UntoldEngine__U4DControllerInterface__) */