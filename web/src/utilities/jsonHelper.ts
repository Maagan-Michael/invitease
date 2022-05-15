export class JsonHelper {
    static toCamelCase(input: any): any {
        if (input instanceof Array) {
            return JsonHelper.arrayToCamelCase(input);
        } else {
            return JsonHelper.objectToCamelCase(input);
        }
    }

    private static objectToCamelCase(input: any) {
        let result: any = {};
        for (let sourceKey in input) {
            if (input.hasOwnProperty(sourceKey)) {
                let targetKey = JsonHelper.valueToCamelCase(sourceKey);
                let value = input[sourceKey]
                if (value instanceof Array || (value !== null && value.constructor === Object)) {
                    value = JsonHelper.toCamelCase(value)
                }
                result[targetKey] = value
            }
        }
        return result
    }

    private static arrayToCamelCase(input: Array<any>) {
        const convertProperty = (value: any) => {
            if (typeof value === "object") {
                value = JsonHelper.toCamelCase(value)
            }
            return value
        }
        return input.map(convertProperty);
    }

    private static valueToCamelCase(input: string) {
        let result = input.charAt(0).toLowerCase();
        let index = 1;
        for (; index < input.length; index++) {
            if (input[index] == '_') {
                index++;
                result += input[index].toUpperCase();
            } else {
                result += input[index];
            }
        }
        return result;
    }
}