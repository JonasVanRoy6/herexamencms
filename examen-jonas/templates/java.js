
function filterItems(category) {
    document.querySelectorAll('.product').forEach(function(product) {
        if (category === '*' || product.dataset.category === category) {
            product.style.display = 'block'; // Toon het product
        } else {
            product.style.display = 'none'; // Verberg het product
        }
    });
}


function sortItemsByScore(order) {
    var productList = document.querySelector('.product-list');
    var products = Array.from(productList.children);
    
    products.sort(function(a, b) {
        var scoreA = parseFloat(a.querySelector('.score').textContent.replace('$', ''));
        var scoreB = parseFloat(b.querySelector('.score').textContent.replace('$', ''));
        return order === 'asc' ? scoreA - scoreB : scoreB - scoreA;
    });

    products.forEach(function(product) {
        productList.appendChild(product); // Herpositioneer producten in gesorteerde volgorde
    });
}