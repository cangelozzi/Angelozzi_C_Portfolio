(() => {
  console.log("Welcome to my Portfolio, let's connect!");

  const flipping = new Flipping();

  const elImages = Array.from(document.querySelectorAll("#myWorks .ui-big-image"));
  const elThumbnails = Array.from(document.querySelectorAll("#myWorks .ui-thumbnail"));

  // VUE instance
  const vm = new Vue({
    el: "#app",

    data: {
      navigationList: ["skills", "works", "about", "contact"],

      skills: {
        webDevelopment: {
          title: "Web Development",
          desc:
            "Experience in Frontend and Backend web development with HTML5 / CSS3, Javascript, NodeJS, VueJS, PHP/MySQL and Laravel.",
          icon: "fas fa-terminal"
        },

        webDesign: {
          title: "Web Design",
          desc:
            "Approaching digital media design and UX/UI layouts in a clean and dynamic way. Use of Adobe Creative package for the creative mood.",
          icon: "fas fa-pencil-alt"
        },

        digitalMedia: {
          title: "Digital Media",
          desc:
            "Understand that a positive and effective communication involves different types of media including 3D/animations, infographics and video.",
          icon: "fas fa-cubes"
        },

        futureProof: {
          title: "Be Future-Proof",
          desc:
            "Continuous learning is not an option. Try-Learn-Improve-Repeat. Involvement in Blockchain Dev, Web Audio and Generative Art are steps toward the future.",
          icon: "far fa-lightbulb"
        }
      },
      projectsData: [],
      state: { photo: 0 },
      elImages,
      elThumbnails
    },

    created: function() {
      this.moveImg(0);
      this.fetchProjectsData();
    },

    methods: {
      fetchProjectsData() {
        url = "./includes/index.php";

        fetch(url) // pass in the one or many query
          .then(res => res.json())
          .then(data => {
            console.log(data);
            this.projectsData = data;
          })
          .catch(function(error) {
            console.log(error);
          });
      },

      moveImg(event) {
        // read cuticle positions
        flipping.read();

        const elActives = document.querySelectorAll("[data-active]");

        Array.from(elActives).forEach(el => el.removeAttribute("data-active"));

        switch (event) {
          case "PREV":
            this.state.photo--;
            // Math.max(state.photo - 1, 0);
            break;
          case "NEXT":
            this.state.photo++;
            // Math.min(state.photo + 1, elImages.length - 1);
            break;
          default:
            this.state.photo = +event;
            break;
        }

        var len = this.elImages.length;
        // Loop Around
        //state.photo = ( ( state.photo % len) + len ) % len;
        this.state.photo = Math.max(0, Math.min(this.state.photo, len - 1));

        Array.from(
          document.querySelectorAll(`[data-key="${this.state.photo}"]`)
        ).forEach(el => {
          el.setAttribute("data-active", true);
        });

        // execute the FLIP animation
        flipping.flip();
      }
    }
  });

  // LOTTIE bodymovin script
  let animation = bodymovin.loadAnimation({
    container: document.getElementById("bm"),
    render: "svg",
    loop: false,
    autoplay: true,
    path: "js/data.json"
  });

  // -------- PRESENTATION TYPEWRITER EFFECT ----- //

  class TypeWriter {
    constructor(txtElement, words, wait = 2000) {
      this.txtElement = txtElement;
      this.words = words;
      this.txt = "";
      this.wordIndex = 0; // index for the words array, set to the first one
      this.wait = parseInt(wait, 10); // parse time so that is always an integer
      this.type(); // method with logic
      this.isDeleting = false; // state of the effect going back deleting word
    }

    // type method
    type() {
      // current index of words
      const currentWord = this.wordIndex % this.words.length;
      // get full text of currentWord
      const fullTxt = this.words[currentWord];

      // check if word is deleting
      if (this.isDeleting) {
        // Remove character
        this.txt = fullTxt.substring(0, this.txt.length - 1);
      } else {
        // Add a character
        this.txt = fullTxt.substring(0, this.txt.length + 1);
      }

      // output word every 0.5s
      this.txtElement.innerHTML = `<span class="txt">${this.txt}</span>`;

      // initial type speed
      let typeSpeed = 100;

      // type speed faster when deleting back the word
      if (this.isDeleting) {
        typeSpeed /= 2;
      }

      // If word is complete
      if (!this.isDeleting && this.txt === fullTxt) {
        typeSpeed = this.wait; // pause at the end of the typed word
        this.isDeleting = true; // Deleting can start
      } else if (this.isDeleting && this.txt === "") {
        this.isDeleting = false;
        // move to next word
        this.wordIndex++;
        // pause start typing again
        typeSpeed = 100;
      }

      // call type method every 0.5 sec
      setTimeout(() => this.type(), typeSpeed);
    }
  }

  // init app
  function init() {
    const txtElement = document.querySelector(".txt-type");
    const words = JSON.parse(txtElement.getAttribute("data-words")); // string is parsed to array/obj
    const wait = txtElement.getAttribute("data-wait");

    // initialize type writer
    setTimeout(() => {
      new TypeWriter(txtElement, words, wait);
    }, 3600);
  }
  // -------- end PRESENTATION TYPEWRITER EFFECT ----- //

  // initialize Dom, same as window onload
  document.addEventListener("DOMContentLoaded", init);

  // reload page always on top
  window.onbeforeunload = function() {
    window.scrollTo(0, 0);
  };
})();
