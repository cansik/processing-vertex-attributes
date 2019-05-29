import peasy.PeasyCam;

PeasyCam cam;
PShader pointShader;

int pointCount = 500;
float pointScale = 3.0f;

PShape mesh;

void setup() {
  size(500, 500, P3D);
  pixelDensity(2);
  frameRate(60);

  surface.setTitle("Vertex Attribute Test");

  cam = new PeasyCam(this, 0, 0, 0, 400);
  cam.setSuppressRollRotationMode();

  pointShader = loadShader("shader/pointColor.glsl", "shader/pointVertex.glsl");

  setupMesh();
} 

void draw() {
  background(255);

  cam.rotateY(0.005);

  hint(DISABLE_DEPTH_TEST);
  shader(pointShader);
  pointShader.set("pointScale", pointScale);

  shape(mesh);

  resetShader();
  hint(ENABLE_DEPTH_TEST);
}

void setupMesh() {
  // create mesh
  mesh = createShape();
  mesh.beginShape(POINTS);

  mesh.attrib("pointIndex", 0.5f);

  for (int i = 0; i < pointCount; i++) {
    PVector p = PVector.random3D();
    p.mult(150);

    mesh.stroke(100, 200, 255);
    mesh.vertex(p.x, p.y, p.z);
  }
  mesh.endShape();

  // update indexes
  for (int i = 0; i < mesh.getVertexCount(); i++) {
    mesh.setAttrib("pointIndex", i, i / (float)pointCount);
  }
}

void keyPressed() {
  setupMesh();
}
