//
//  BodyForceRegistry.h
//  UntoldEngine
//
//  Created by Harold Serrano on 6/23/13.
//  Copyright (c) 2013 Untold Story Studio. All rights reserved.
//

#ifndef __UntoldEngine__U4DPhysicsEngine__
#define __UntoldEngine__U4DPhysicsEngine__

#include <iostream>
#include <vector>

#include "U4DDynamicModel.h"
#include "U4DBodyForceGenerator.h"
#include "U4DIntegrator.h"
#include "U4DGravityForceGenerator.h"
#include "U4DImpulseForceGenerator.h"

namespace U4DEngine {
    
class U4DPhysicsEngine{
  
private:
    
    U4DIntegrator *integrator;
    
    U4DGravityForceGenerator gravityForce;
    
    U4DImpulseForceGenerator impulseForce;
    
    
protected:

    
public:
    
    U4DPhysicsEngine();
    
    ~U4DPhysicsEngine();
    
    //run the physics
    void updatePhysicForces(U4DDynamicModel *uModel,float dt);
    
    void setIntegrator(U4DIntegrator *uIntegrator);
    
    void integrate(U4DDynamicModel *uModel,float dt);
    
    void resolveForcesAndMoments(U4DDynamicModel *uModel,float dt);
    
    void setGravity(U4DVector3n& uGravity);
    
    U4DVector3n getGravity();
    
};

}

#endif /* defined(__UntoldEngine__U4DPhysicsEngine__) */