//
//  U4DScene.cpp
//  MVCTemplate
//
//  Created by Harold Serrano on 4/23/13.
//  Copyright (c) 2013 Untold Story Studio. All rights reserved.
//

#include "U4DScene.h"
#include "U4DWorld.h"
#include "U4DDirector.h"
#include "U4DTouches.h"

namespace U4DEngine {
    
//constructor
U4DScene::U4DScene(){
    
    

};

//destructor
U4DScene::~U4DScene(){
    
    delete entityManager;

};

void U4DScene::setGameWorldControllerAndModel(U4DWorld *uGameWorld,U4DControllerInterface *uGameController, U4DGameModelInterface *uGameModel){
    
    U4DDirector *director=U4DDirector::sharedInstance();
    director->setScene(this);
    
    gameWorld=uGameWorld;
    gameController=uGameController;
    
    gameWorld->init();
    gameController->init();
    
    gameWorld->setGameController(gameController);
    
    entityManager=new U4DEntityManager();
    
    entityManager->setRootEntity(gameWorld);
    
    entityManager->setPhysicsProperties();
    
}


void U4DScene::update(float dt){
    
    //update the view
    entityManager->update(dt); //need to add dt to view
    
    gameController->update(dt);
}

void U4DScene::draw(){

    entityManager->draw();
    gameController->draw();
    
}


void U4DScene::touchBegan(const U4DTouches &touches){
    
    gameController->touchBegan(touches);
}

void U4DScene::touchEnded(const U4DTouches &touches){
    
    gameController->touchEnded(touches);
}

void U4DScene::touchMoved(const U4DTouches &touches){
    
    gameController->touchMoved(touches);
}

void U4DScene::init(){
    
}
    
}
