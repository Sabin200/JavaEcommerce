let openShopping = document.querySelector('.shopping');
let closeShopping = document.querySelector('.closeShopping');
let list = document.querySelector('.list');
let listCard = document.querySelector('.listCard');
let body = document.querySelector('body');
let total = document.querySelector('.total');
let quantity = document.querySelector('.quantity');


openShopping.addEventListener('click', ()=>{
    body.classList.add('active');
})
closeShopping.addEventListener('click', ()=>{
    body.classList.remove('active');
})

let products = [
    {
        id: 1,
        name: 'Men Solid Waffle Knit Tee',
        image: 'm1.webp',
        price: 250,
        category: 'T-shirt'
    },

    {
        id: 2,
        name: 'Men Ribbed Knit Tank Top',
        image: 'm2.webp',
        price: 110,
        category: 'Tank Top'
    },

    {
        id: 3,
        name: 'Men Quarter Zipper Polo Shirt',
        image: 'm3.webp',
        price: 230,
        category: 'T-shirt'
    },

    {
        id: 4,
        name: 'Men Solid Straight Leg Pants',
        image: 'm4.webp',
        price: 320,
        category: 'Pants'
    },
    {
        id: 5,
        name: 'Solid Straight Leg Pants',
        image: 'm5.webp',
        price: 452,
        category: 'Pants'
    },
    {
        id: 6,
        name: 'Men Patched Pocket Denim Shirt',
        image: 'm6.webp',
        price: 560,
        category: 'Jeans'
    },
    {
        id: 7,
        name: 'Men Plaid Print Pocket Patched Coat',
        image: 'm7.webp',
        price: 490,
        category: 'Blazer'
    },
    {
        id: 8,
        name: 'Men Hand Print Sweatshirt',
        image: 'm8.webp',
        price: 560,
        category: 'Sweatshirt'
    },
    {
        id: 9,
        name: 'Men Slant Pockets Blazer & Tailored Pants',
        image: 'm9.webp',
        price: 590,
        category: 'Suits'
    },
    {
        id: 10,
        name: 'Men Lapel Collar Blazer & Pants Set',
        image: 'm10.webp',
        price: 480,
        category: 'Suits'
    },
    {
        id: 11,
        name: 'Men Flap Pocket Button Front Denim Jacket',
        image: 'm11.webp',
        price: 180,
        category: 'Jacket'
    },
    {
        id: 12,
        name: 'Men Letter Patched Drawstring Waist Shorts',
        image: 'm12.webp',
        price: 220,
        category: 'Shorts'
    }
];

let listCards  = [];
function initApp(){
    products.forEach((value, key) =>{
        let newDiv = document.createElement('div');
        newDiv.classList.add('item');
        newDiv.innerHTML = `
            <img src="image/${value.image}">
            <div class="title">${value.name}</div>
            <div class="price">${value.price.toLocaleString()}</div>
            <button onclick="addToCard(${key})">Add To Card</button>`;
        list.appendChild(newDiv);
    })
}
initApp();
function addToCard(key){
    if(listCards[key] == null){
        // copy product form list to list card
        listCards[key] = JSON.parse(JSON.stringify(products[key]));
        listCards[key].quantity = 1;
    }
    reloadCard();
}


function reloadCard(){
    listCard.innerHTML = '';
    let count = 0;
    let totalPrice = 0;
    listCards.forEach((value, key)=>{
        totalPrice = totalPrice + value.price;
        count = count + value.quantity;
        if(value != null){
            let newDiv = document.createElement('li');
            newDiv.innerHTML = `
                <div><img src="image/${value.image}"/></div>
                <div>${value.name}</div>
                <div>${value.price.toLocaleString()}</div>
                <div>
                    <button onclick="changeQuantity(${key}, ${value.quantity - 1})">-</button>
                    <div class="count">${value.quantity}</div>
                    <button onclick="changeQuantity(${key}, ${value.quantity + 1})">+</button>
                </div>`;
                listCard.appendChild(newDiv);
        }
    })
    total.innerText = totalPrice.toLocaleString();
    quantity.innerText = count;
}
function changeQuantity(key, quantity){
    if(quantity == 0){
        delete listCards[key];
    }else{
        listCards[key].quantity = quantity;
        listCards[key].price = quantity * products[key].price;
    }
    reloadCard();
}


function initApp() {
    products.forEach((value, key) => {
        let newDiv = document.createElement('div');
        newDiv.classList.add('item');
        newDiv.innerHTML = `
            <img src="image/${value.image}">
            <div class="title">${value.name}</div>
            <div class="price">${value.price.toLocaleString()}</div>
            <button onclick="addToCard(${key})">Add To Cart</button>
            <button class="details-btn">Details</button>`;
        list.appendChild(newDiv);

        // add event listener to the details button
        let detailsBtn = newDiv.querySelector('.details-btn');
    if (key === 0) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/himDetails.html';
        });
    } else if (key === 1) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/a2.html';
        });
    } else if (key === 2) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/a3.html';
        });
    } 

    else if (key === 3) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/a4.html';
        });
    } 

    else if (key === 4) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/B1.html';
        });
    } 

    else if (key === 5) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/b2.html';
        });
    } 

    else if (key === 6) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/b3.html';
        });
    } 

    else if (key === 7) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/b4.html';
        });
    } 

    else if (key === 8) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/b5.html';
        });
    } 

    else if (key === 9) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/b6.html';
        });
    } 

    else if (key === 10) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/b7.html';
        });
    } 
    
    else if (key === 11) {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'maleProducts_1stPage/b8.html';
        });
    } 
    
    else {
        detailsBtn.addEventListener('click', () => {
            window.location.href = 'default.html';
        });
    }
})
};

const filterContainer = document.querySelector(".dropbtn1"),
galleryItems = document.querySelectorAll(".gallery-item");

filterContainer.addEventListener("click", (event) =>{
  if(event.target.classList.contains("filter-item")){
       // deactivate existing active 'filter-item'
       filterContainer.querySelector(".active").classList.remove("active");
       // activate new 'filter-item'
       event.target.classList.add("active");
       const filterValue = event.target.getAttribute("data-filter");
       galleryItems.forEach((item) =>{
      if(item.classList.contains(filterValue) || filterValue === 'all'){
          item.classList.remove("hide");
           item.classList.add("show");
      }
      else{
          item.classList.remove("show");
          item.classList.add("hide");
      }
       });
  }
});

let productFilter = products;
showProduct(productFilter);
function showProduct(productFilter){
    count.innerText = productFilter.length;
    list.innerHTML = '';
    productFilter.forEach(item => {
        let newItem = document.createElement('div');
        newItem.classList.add('item');

        list.appendChild(newItem);
    });
}

function filterSearch(event) {
    event.preventDefault();
    const filters = document.querySelectorAll(".filter select, .filter input");
    const lists = document.getElementById("lists").children;
  
    for (let i = 0; i < lists.length; i++) {
      let shouldHide = false;
  
      for (let j = 0; j < filters.length; j++) {
        if (filters[j].name === "category" && filters[j].selectedIndex > 0) {
          if (lists[i].getAttribute("data-category") !== filters[j].value) {
            shouldHide = true;
            break;
          }
        } else if (filters[j].name === "brand" && filters[j].selectedIndex > 0) {
          if (lists[i].getAttribute("data-brand") !== filters[j].value) {
            shouldHide = true;
            break;
          }
        } else if (filters[j].name === "rating" && filters[j].selectedIndex > 0) {
          if (lists[i].getAttribute("data-rating") !== filters[j].value) {
            shouldHide = true;
            break;
          }
        } else if (filters[j].name === "minPrice" && filters[j].value !== "") {
          if (parseInt(lists[i].getAttribute("data-price")) < parseInt(filters[j].value)) {
            shouldHide = true;
            break;
          }
        } else if (filters[j].name === "maxPrice" && filters[j].value !== "") {
          if (parseInt(lists[i].getAttribute("data-price")) > parseInt(filters[j].value)) {
            shouldHide = true;
            break;
          }
        }
      }
  
      if (shouldHide) {
        lists[i].classList.add("hide");
      } else {
        lists[i].classList.remove("hide");
      }
    }
  }

function submitHandler(e) {
    e.preventDefault();
    
    const form = e.target;
    const formData = new FormData(form);
  
    // log the form data to the console
    for (const [name, value] of formData) {
      console.log(`${name}: ${value}`);
    }
  
    // TODO: use the form data to filter the list of products
  }

  