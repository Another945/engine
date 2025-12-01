/// @description When destroyed

if destroyObject != -1 {
    var i = instance_create(x, y, destroyObject);
        i.image_xscale = image_xscale;
}
instance_destroy();

