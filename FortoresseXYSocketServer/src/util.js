/**
 * @param {number} radians 
 * @returns {number}
 */
export function radiansToDegrees(radians) {
    return radians * 180 / Math.PI;
}

/**
 * @param {number} degrees 
 * @returns {number}
 */
export function degreesToRadians(degrees) {
    return degrees * Math.PI / 180;
}