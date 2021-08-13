/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cybattis <cybattis@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/06 10:01:26 by cybattis          #+#    #+#             */
/*   Updated: 2021/08/11 11:07:17 by cybattis         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>

char	*ft_strstr(char *str, char *to_find);

int	main(void)
{
	char	dest[] = "je cherche wesh gros";
	char	dest2[] = "Ouais gros !";
	char	dest3[] = "Mais Wesh gros t'es vide!";

	printf("%s\n", ft_strstr(dest, "wesh gros"));
	printf("%s\n", strstr(dest, "wesh gros"));
	printf("%s\n", ft_strstr(dest2, "ua"));
	printf("%s\n", strstr(dest2, "ua"));
	printf("%s\n", ft_strstr(dest3, "salut"));
	printf("%s\n", strstr(dest3, "salut"));
	printf("Empty to_find: %s\n", ft_strstr(dest3, ""));
	printf("Empty to_find: %s\n", strstr(dest3, ""));
	return (0);
}
