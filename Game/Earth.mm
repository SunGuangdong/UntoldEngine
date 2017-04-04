//
//  Earth.cpp
//  UntoldEngine
//
//  Created by Harold Serrano on 5/26/13.
//  Copyright (c) 2013 Untold Story Studio. All rights reserved.
//

#include "Earth.h"

#include "CommonProtocols.h"

#include <stdio.h>

#include "U4DDirector.h"

#include "U4DMatrix3n.h"
#include "U4DButton.h"
#include "U4DSkyBox.h"
#include "U4DTouches.h"
#include "U4DCamera.h"
#include "U4DControllerInterface.h"

#include "GameController.h"
#include "U4DSprite.h"
#include "U4DLights.h"
#include "U4DLogger.h"
#include "U11Ball.h"
#include "U11Field.h"
#include "U11Player.h"
#include "U11Team.h"

#include "GameLogic.h"

using namespace U4DEngine;

void Earth::init(){
    
    U4DCamera *camera=U4DCamera::sharedInstance();
    camera->translateBy(0.0, 80.0, 100.0);
    camera->rotateBy(-36.0, 0.0, 0.0);
    
    setName("earth");
    
    enableShadows();
    
    U4DDirector *director=U4DDirector::sharedInstance();
    
    director->setWorld(this);
    
    team=new U11Team();
    
    oppositeTeam=new U11Team();
    
    team->setOppositeTeam(oppositeTeam);
    
    ball=new U11Ball();
    ball->init("ball", "blenderscript.u4d");
    
    field=new U11Field();
    field->init("field0", "blenderscript.u4d");

    player10=new U11Player();
    player10->init("pele", "characterscript.u4d");
    
    player10->subscribeTeam(team);
    
    player11=new U11Player();
    player11->init("pele", "characterscript.u4d");
    
    player11->subscribeTeam(team);
    
    player9=new U11Player();
    player9->init("pele", "characterscript.u4d");
    
    player9->subscribeTeam(team);
    
    //opposite team
    oppositePlayer10=new U11Player();
    oppositePlayer10->init("pele", "characterscript.u4d");
    
    oppositePlayer10->subscribeTeam(oppositeTeam);
    
    //set ball entity
    field->setSoccerBall(ball);
    
    team->setSoccerBall(ball);
    
    oppositeTeam->setSoccerBall(ball);
    
    U4DVector3n origin(0,0,0);

    U4DLights *light=U4DLights::sharedInstance();
    light->translateTo(5.0,5.0,5.0);
    light->viewInDirection(origin);
    
    addChild(ball);
    
    addChild(field);

    addChild(player10);
    
    addChild(player11);
    
    addChild(player9);
    
    addChild(oppositePlayer10);
    
    //set the team
    GameLogic *gameModel=dynamic_cast<GameLogic*>(getGameModel());
    
    gameModel->setTeamToControl(team);
    
    
    //set the ball position
    ball->translateBy(-25.0, 0.0, 15.0);
    //set the player position
    
    player10->translateBy(-40.0, player10->getModelDimensions().y/2.0+1.3, 0.0);
    
    player11->translateBy(0.0, player11->getModelDimensions().y/2.0+1.3, -20.0);
    
    player9->translateBy(40.0, player9->getModelDimensions().y/2.0+1.3, 15.0);
    
    oppositePlayer10->translateBy(-10.0, oppositePlayer10->getModelDimensions().y/2+1.3, 0.0);
}

void Earth::update(double dt){
    
    U4DCamera *camera=U4DCamera::sharedInstance();
    camera->followModel(ball, 0.0, 80.0, 100.0);
    

}





