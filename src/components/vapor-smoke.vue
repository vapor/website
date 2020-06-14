<template lang="pug">
.vapor-smoke
  .canvas(ref="canvas")
</template>

<script>
export default {
  name: 'vapor-smoke',
  props: [],
  methods: {
    click(e) {
      e.preventDefault()
      if (this.disabled) {
        return
      }
      this.$emit('action', e)
    },
  },
  mounted() {
    var clock = new THREE.Clock();
    var renderer = new THREE.WebGLRenderer({ alpha: true })
    renderer.setSize(window.innerWidth, window.innerHeight)
    window.addEventListener('resize', () => {
      renderer.setSize(window.innerWidth, window.innerHeight)
    });
    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000)
    camera.position.z = 1000
    scene.add(camera)
    var geometry = new THREE.CubeGeometry(200, 200, 200);
    var material = new THREE.MeshLambertMaterial({
      color: 0xffffff, 
      wireframe: false
    });
    var mesh = new THREE.Mesh(geometry, material);
    var cubeSineDriver = 0;
    THREE.ImageUtils.crossOrigin = '';
    var light = new THREE.DirectionalLight(0xffffff, 0.5);
    light.position.set(-1,0,1);
    scene.add(light);
    var smokeTexture = THREE.ImageUtils
      .loadTexture('https://s3-us-west-2.amazonaws.com/s.cdpn.io/95637/Smoke-Element.png')
    var smokeMaterial = new THREE.MeshLambertMaterial({
      color: 0x3DC3FF, 
      map: smokeTexture, 
      transparent: true
    })
    var smokeMaterial2 = new THREE.MeshLambertMaterial({
      color: 0xE040FB, 
      map: smokeTexture, 
      transparent: true
    })
    var smokeGeo = new THREE.PlaneGeometry(300, 300);
    var smokeParticles = [];
    for (var p = 0; p < 150; p++) {
        var material = (p % 2 == 0) ? smokeMaterial : smokeMaterial2;
        var particle = new THREE.Mesh(smokeGeo,material);
        particle.position.set(Math.random() * 500 - 250, Math.random() * 500 - 250, Math.random() * 1000 - 100)
        particle.rotation.z = Math.random() * 360
        scene.add(particle)
        smokeParticles.push(particle)
    }
    this.$refs.canvas.appendChild(renderer.domElement)

    var delta;
    var _this = this;
    function animate() {
      if (!_this.active) {
        return;
      }
      delta = clock.getDelta()
      requestAnimationFrame(animate)
      evolveSmoke()
      render()
    }
 
    function evolveSmoke() {
      var sp = smokeParticles.length
      while(sp--) {
        smokeParticles[sp].rotation.z += (delta * 0.2)
      }
    }

    function render() { 
      mesh.rotation.x += 0.005
      mesh.rotation.y += 0.01
      cubeSineDriver += .01
      mesh.position.z = 100 + (Math.sin(cubeSineDriver) * 500)
      renderer.render(scene, camera)
    }

    animate()
  },
  beforeDestroy() {
    this.active = false
  },
  data() {
    return { active: true }
  }
}
</script>

<style scoped lang="sass">
@import "@/assets/base.sass"
.vapor-smoke
  background: clear
  overflow: hidden
  .canvas, canvas
    width: 100%
    height: 100%
</style>