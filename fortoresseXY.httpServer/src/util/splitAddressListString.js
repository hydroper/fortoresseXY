/**
 * @param {string} string
 */
export function splitAddressListString(string) {
    const list = string.split(",").map(p => p.trim());
    const emptyIndices = [];
    for (let i = 0; i < list.length; ++i) {
        if (list[i] == "") {
            emptyIndices.push(i);
        }
    }
    for (const i of emptyIndices) {
        list.splice(i, 1);
    }
    return list.length == 0 ? [] : list;
}