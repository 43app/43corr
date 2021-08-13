/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cybattis <cybattis@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/06 10:01:26 by cybattis          #+#    #+#             */
/*   Updated: 2021/08/10 16:35:40 by cybattis         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>

int	ft_strcmp(char *s1, char *s2);

int	main(void)
{
	char	str[] = "coucou";
	char	str1[] = "sheh";
	char	str2[] = "test";

	printf("%d\n", ft_strcmp(str, ""));
	printf("std: %d\n", strcmp(str, ""));
	printf("%d\n", ft_strcmp(str, "test"));
	printf("std: %d\n", strcmp(str, "test"));
	printf("%d\n", ft_strcmp(str1, "sreh"));
	printf("std: %d\n", strcmp(str1, "sreh"));
	printf("%d\n", ft_strcmp(str2, "tert"));
	printf("std: %d\n", strcmp(str2, "tert"));
	printf("%d\n", ft_strcmp("cou", str));
	printf("std: %d\n", strcmp("cou", str));
	printf("%d\n", ft_strcmp(str, "cou"));
	printf("std: %d\n", strcmp(str, "cou"));
	return (0);
}
