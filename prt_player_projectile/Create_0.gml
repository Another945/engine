/// @description Player Projectile parent

defaultDamage = 1; //Default damage to an enemy/boss/object if it isn't set
                   //within the enemy/boss/object.

stuckTimer = 0;
stuckFrames = 6;
stuckToPlayer = true; //In MMX4, the buster shot the player shoots will stick
                      //to the player for a few frames before moving.
         
destroyObject = obj_effect_buster_destroy;             
destroyType = 0;
/*
0 = When the projectile hits and enemy/boss/object, it will be destroyed
    regardless weither it is the shot that destroys the other.
    
1 = When the projectile hits and enemy/boss/object, it will be destroyed
    unless it is the shot that destroys the other. If so, it will not get
    destroyed.
    
2 = Just rips through everything!
*/
deathToSolid = false; //If the projectile gets destroyed by solid collision

/* */
/*  */
