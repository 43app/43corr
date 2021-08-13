/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cybattis <cybattis@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/06 10:01:26 by cybattis          #+#    #+#             */
/*   Updated: 2021/08/11 13:59:30 by cybattis         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>

int	ft_strncmp(char *s1, char *s2, unsigned int n);

int	main(void)
{
	char s1[] = "";
	char s2[] = "tert";
	char s3[] = "coucou";

	printf("%d\n", ft_strncmp(s1, "Aou", 0));
	printf("sdt: %d\n", strncmp(s1, "Aou", 0));
	printf("%d\n", ft_strncmp(s2, "test", 2));
	printf("sdt: %d\n", strncmp(s2, "test", 2));
	printf("%d\n", ft_strncmp(s2, "test", 4));
	printf("sdt: %d\n", strncmp(s2, "test", 4));
	printf("%d\n", ft_strncmp(s3, "coutou", 3));
	printf("sdt: %d\n", strncmp(s3, "coutou", 3));
	printf("%d\n", ft_strncmp(s3, "coutou", 5));
	printf("sdt: %d\n", strncmp(s3, "coutou", 5));
	printf("%d\n", ft_strncmp(s3, "cou", 10));
	printf("sdt: %d\n", strncmp(s3, "cou", 10));
	return (0);
}
