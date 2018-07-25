export const readyToRender = (requiredProps) => {
    let result = true
    for (let i = 0; i < requiredProps.length; i++) {
        let prop = requiredProps[i]
        if (!prop) { return false }
        if (Array.isArray(prop)) {
            if (prop.length === 0) { return false }
        } else if (typeof prop === 'object') {
            if (Object.keys(prop).length === 0 && prop.constructor === Object) {
                return false
            }
        }
        else if (result) { result = !!prop }
    }
    return result
}

export default {
    readyToRender
}
