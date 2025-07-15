import { reactive } from 'vue';
const obj = reactive({
    a: 1,
    b: 2,
})

const { a, b } = obj
obj.a = 3
console.log(a);