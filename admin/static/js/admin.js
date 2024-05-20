editCategoryName = null
editSubCategoryName = null
newCategoryName = null
newSubCategoryName = null
//get edit category modal element
const EditCategoryModalEle = document.getElementById('EditCategoryModal')
const EditSubCategoryModalEle = document.getElementById('EditSubCategoryModal')
const addCategoryModalEle = document.getElementById('addCategoryModal')
const addSubCategoryModalEle = document.getElementById('addSubCategoryModal')

function addNewCataegory() {
    activateModal(addCategoryModalEle)
    const new_name_category_ele = document.getElementById('new_category')
    newCategoryName = new_name_category_ele.value
    console.log(newCategoryName)
}

function addSubCategory(ele) {
    activateModal(addSubCategoryModalEle)
    category_name = ele.innerHTML
    const new_name_category_ele = document.getElementById('new_sub_category')
    
    newCategoryName = getParentElmentInnerHtml(ele)
    newSubCategoryName = new_name_category_ele.value
    
    console.log(newCategoryName)
    console.log(newSubCategoryName)
}

function EditCategory(ele) {
    activateModal(EditCategoryModalEle)
    category_name = ele.innerHTML
    const new_name_category_ele = document.getElementById('new_name_category')
    new_name_category_ele.value = category_name
    editCategoryName = category_name
    console.log(editCategoryName)
}

function EditSubCategory(ele) {
    activateModal(EditSubCategoryModalEle)
    category_name = ele.innerHTML
    const new_name_category_ele = document.getElementById('new_name_sub_category')
    new_name_category_ele.value = category_name
    
    editCategoryName = getParentElmentInnerHtml(ele)
    editSubCategoryName = category_name
    console.log(editCategoryName)
    console.log(editSubCategoryName)
}

function getParentElmentInnerHtml(ele) {
    category = ele.parentNode.parentNode.previousSibling.previousSibling.children[0].innerHTML
    return category
}



function activateModal(ModalEle) {
    //cahnge the content of the modal
    ModalEle.addEventListener('show.bs.modal', function (event) {
        // Update the modal's content.
        var modalBodyInput = ModalEle.querySelector('.modal-body')
        // modalBodyInput.innerHTML = text
    })
    const Modal = new bootstrap.Modal(ModalEle)
    Modal.show()
}