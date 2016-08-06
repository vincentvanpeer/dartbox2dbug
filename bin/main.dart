import 'package:box2d/box2d.dart';

main(List<String> args) {
  var world = new World.withGravity(new Vector2.zero());

  final CircleShape circleShape = new CircleShape()
    ..radius = 2.0;

  final circleBodyDef = new BodyDef()
    ..position = new Vector2(0.0, 0.0);

  final circleFixtureDef = new FixtureDef()
    ..shape = circleShape;

  final body = world.createBody(circleBodyDef);
  body.createFixtureFromFixtureDef(circleFixtureDef);

  final PolygonShape polygonShape = new PolygonShape()
    ..set(
        [
          new Vector2(-0.5, -0.5),
          new Vector2(-0.5, 0.5),
          new Vector2(0.5, 0.5),
          new Vector2(0.5, -0.5)
        ],
        4
    );

  final polygonBodyDef = new BodyDef()
    ..linearVelocity = new Vector2(0.0, -2.0)
    ..position = new Vector2(0.0, 4.0)
    ..type = BodyType.DYNAMIC;

  final polygonFixtureDef = new FixtureDef()
    ..shape = polygonShape;

  final polygonBody = world.createBody(polygonBodyDef);
  polygonBody.createFixtureFromFixtureDef(polygonFixtureDef);

  world.stepDt(1.0, 1, 1);
}
